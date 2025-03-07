#!/bin/bash

#download_cfmd_mags

d=$1

list_1_0_0=('AlvarezOrdonezA_xxxx' 'ArikanM_2020' 'BertuzziAS_2018' 'ChaconVargasK_2020' 'CM_INJERA' 'CrovadoreJ_2017' 'DeFilippisF_xxxx' 'DeRoosJ_2020'
'DuR_2020' 'DuruIC_2018' 'EinsonEJ_2018' 'EscobarZepedaA_2016' 'FerrocinoI_2018' 'HeilCS_2018' 'HellmannSL_2020' 'KastmanEK_2016' 'KawaiT_2012' 'KumarJ_2019' 'LandisEA_2021' 'LeechJ_2020'
'LeechJ_xxxx' 'LeonardSR_2016' 'LiZ_2018' 'LiZ_2019' 'LordanR_2019' 'MASTER_WP4_CSIC_1' 'MASTER_WP4_CSIC_2' 'MASTER_WP4_FFoQSI_1' 'MASTER_WP4_FFoQSI_2' 'MASTER_WP4_FFoQSI_3' 'MASTER_WP4_MATIS_1'
'MASTER_WP4_TEAGASC_1' 'MASTER_WP4_UNINA_1' 'MASTER_WP4_UNINA_2' 'McHughAJ_2020' 'MilaniC_2019' 'MortensenS_xxxx' 'PasolliE_2020' 'PatroJN_2016' 'PfeferT_xxxx' 'PorcellatoD_2016' 'PothakosV_2020' 'QuigleyL_2016' 'RippF_2014'
'SalvettiE_2016' 'SomervilleV_2019' 'SternesPR_2017' 'SulaimanJ_2014' 'VerceM_2019' 'WalshAM_2016' 'WalshAM_2017' 'WalshAM_2020' 'WalshL_xxxx' 'WolfeBE_2014' 'XieM_2019' 'YaoG_2017' 'YasirM_2020' 'YulandiA_2020' 'ZhaoCC_2020')



list_1_2_1=('ShangpliangH_2023_a' 'ShangpliangH_2023_b' 'KharnaiorP_2023' 'YouL_2022' 'LimaC_2020' 'DecadtH_2024' 'YasirM_2022' 'FontanaF_2023' 'FranciosaI_2021'
'MotaGutierrezJ_2021' 'SaakC_2023' 'YangC_2021' 'LopezSanchezR_2023' 'GonzalezOrozcoB_2023' 'SalgadoTS_2021' 'FalardeauJ_2023' 'SequinoG_2024_a' 'SequinoG_2024_b' 'MagliuloR_2024'
'YapM_2020' 'OlgaP_2019' 'QuijadaN_2022' 'YuY_2022' 'TomarS_2023' 'AlmeidaO_2020' 'CM_UNINA_FFOOD' )

zen_1="14871720"

zen_2="14906604"

for d in "$@"; do
    zen_doi=""


    for item in "${list_1_0_0[@]}"; do
        if [[ "$d" == "$item" ]]; then
            zen_doi="$zen_1"
            break
        fi
    done


    if [[ -z "$zen_doi" ]]; then
        for item in "${list_1_2_1[@]}"; do
            if [[ "$d" == "$item" ]]; then
                zen_doi="$zen_2"
                break
            fi
        done
    fi

    if [[ -z "$zen_doi" ]]; then
        echo "Dataset '$d' is not available in cFMD"
        continue
    fi

    file="${d}_mags.tar.gz"
    wget "https://zenodo.org/records/$zen_doi/files/${d}_mags.tar.gz?download=1" -O "$file"

    mkdir -p "${d}_mags" && tar -xzf "$file" -C "${d}_mags"

done
