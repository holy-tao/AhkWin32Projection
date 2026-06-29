#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct CLSIDDATA {
    #StructPack 4

    m_clsid : Guid

    m_cReferences : UInt32

    m_cBound : UInt32

    m_cPooled : UInt32

    m_cInCall : UInt32

    m_dwRespTime : UInt32

    m_cCallsCompleted : UInt32

    m_cCallsFailed : UInt32

}
