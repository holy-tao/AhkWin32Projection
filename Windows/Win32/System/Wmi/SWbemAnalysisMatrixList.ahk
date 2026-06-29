#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SWbemAnalysisMatrix.ahk" { SWbemAnalysisMatrix }

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct SWbemAnalysisMatrixList {
    #StructPack 8

    m_uVersion : UInt32

    m_uMatrixType : UInt32

    m_uNumMatrices : UInt32

    m_pMatrices : SWbemAnalysisMatrix.Ptr

}
