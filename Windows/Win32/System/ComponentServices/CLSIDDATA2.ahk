#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\COMPLUS_APPTYPE.ahk" { COMPLUS_APPTYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct CLSIDDATA2 {
    #StructPack 8

    m_clsid : Guid

    m_appid : Guid

    m_partid : Guid

    m_pwszAppName : PWSTR

    m_pwszCtxName : PWSTR

    m_eAppType : COMPLUS_APPTYPE

    m_cReferences : UInt32

    m_cBound : UInt32

    m_cPooled : UInt32

    m_cInCall : UInt32

    m_dwRespTime : UInt32

    m_cCallsCompleted : UInt32

    m_cCallsFailed : UInt32

}
