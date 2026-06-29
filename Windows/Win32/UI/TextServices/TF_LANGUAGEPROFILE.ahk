#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The TF_LANGUAGEPROFILE structure contains information about a language profile.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ns-msctf-tf_languageprofile
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TF_LANGUAGEPROFILE {
    #StructPack 4

    /**
     * Specifies the class identifier of the text service within the language profile.
     */
    clsid : Guid

    /**
     * Specifies the language identifier of the profile.
     */
    langid : UInt16

    /**
     * Specifies the identifier of the category that the text service belongs to.
     */
    catid : Guid

    /**
     * A Boolean value, when <b>TRUE</b>, indicates that the language is activated.
     */
    fActive : BOOL

    /**
     * Specifies the identifier of the language profile.
     */
    guidProfile : Guid

}
