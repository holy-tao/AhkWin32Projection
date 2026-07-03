#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * This structure is intended for infrastructure use only.
 * @see https://learn.microsoft.com/windows/win32/api/featurestagingapi/ns-featurestagingapi-feature_error
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct FEATURE_ERROR {
    #StructPack 8

    /**
     * Infrastructure use only.
     */
    hr : HRESULT

    /**
     * Infrastructure use only.
     */
    lineNumber : UInt16

    /**
     * Infrastructure use only.
     */
    file : PSTR

    /**
     * Infrastructure use only.
     */
    process : PSTR

    /**
     * Infrastructure use only.
     */
    module : PSTR

    /**
     * Infrastructure use only.
     */
    callerReturnAddressOffset : UInt32

    /**
     * Infrastructure use only.
     */
    callerModule : PSTR

    /**
     * Infrastructure use only.
     */
    message : PSTR

    /**
     * Infrastructure use only.
     */
    originLineNumber : UInt16

    /**
     * Infrastructure use only.
     */
    originFile : PSTR

    /**
     * Infrastructure use only.
     */
    originModule : PSTR

    /**
     * Infrastructure use only.
     */
    originCallerReturnAddressOffset : UInt32

    /**
     * Infrastructure use only.
     */
    originCallerModule : PSTR

    /**
     * Infrastructure use only.
     */
    originName : PSTR

}
