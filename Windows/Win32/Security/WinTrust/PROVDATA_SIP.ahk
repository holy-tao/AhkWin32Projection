#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Cryptography\Sip\SIP_DISPATCH_INFO.ahk" { SIP_DISPATCH_INFO }
#Import "..\Cryptography\Sip\SIP_INDIRECT_DATA.ahk" { SIP_INDIRECT_DATA }
#Import "..\Cryptography\Sip\SIP_SUBJECTINFO.ahk" { SIP_SUBJECTINFO }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct PROVDATA_SIP {
    #StructPack 8

    cbStruct : UInt32

    gSubject : Guid

    pSip : SIP_DISPATCH_INFO.Ptr

    pCATSip : SIP_DISPATCH_INFO.Ptr

    psSipSubjectInfo : SIP_SUBJECTINFO.Ptr

    psSipCATSubjectInfo : SIP_SUBJECTINFO.Ptr

    psIndirectData : SIP_INDIRECT_DATA.Ptr

}
