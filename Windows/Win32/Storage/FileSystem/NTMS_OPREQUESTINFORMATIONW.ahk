#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The NTMS_OPREQUESTINFORMATION structure defines the properties specific to operator-request system control for RSM. (Unicode)
 * @remarks
 * The 
 * <b>NTMS_OPREQUESTINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ntmsapi.h header defines NTMS_OPREQUESTINFORMATION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_oprequestinformationw
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset Unicode
 */
export default struct NTMS_OPREQUESTINFORMATIONW {
    #StructPack 4

    Request : UInt32

    /**
     * System time when the operator request was submitted.
     */
    Submitted : SYSTEMTIME

    State : UInt32

    /**
     * Operator message text.
     */
    szMessage : WCHAR[256]

    Arg1Type : UInt32

    /**
     * <b>Arg1</b> object ID used for move requests or other operator requests that require a reference object. The purpose of this object varies based on the type of operator request. For appropriate uses of <b>Arg1</b>, see the <b>Request</b> description.
     */
    Arg1 : Guid

    Arg2Type : UInt32

    /**
     * <b>Arg2</b> object ID used for operator requests that require a second reference object. The purpose of this object varies based on the type of operator request. For appropriate uses of <b>Arg2</b>, see the <b>Request</b> description.
     */
    Arg2 : Guid

    /**
     * Application that submitted the operator request.
     */
    szApplication : WCHAR[64]

    /**
     * Interactive user logged on to the computer that submitted the operator request.
     */
    szUser : WCHAR[64]

    /**
     * Computer that submitted the operator request.
     */
    szComputer : WCHAR[64]

}
