#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\IDebugHostType.ahk
#Include .\IDebugHostFunctionLocalStorageEnumerator.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostFunctionLocalDetails extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostFunctionLocalDetails
     * @type {Guid}
     */
    static IID => Guid("{89280ea8-b3b9-408c-be16-32ab28f5c0ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetType", "EnumerateStorage", "GetLocalKind", "GetArgumentPosition"]

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        name := BSTR()
        result := ComCall(3, this, "ptr", name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return name
    }

    /**
     * The GetTypeByName function retrieves a service type GUID for a network service specified by name. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The nspapi.h header defines GetTypeByName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {IDebugHostType} 
     * @see https://learn.microsoft.com/windows/win32/api//content/nspapi/nf-nspapi-gettypebynamew
     */
    GetType() {
        result := ComCall(4, this, "ptr*", &localType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugHostType(localType)
    }

    /**
     * 
     * @returns {IDebugHostFunctionLocalStorageEnumerator} 
     */
    EnumerateStorage() {
        result := ComCall(5, this, "ptr*", &storageEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugHostFunctionLocalStorageEnumerator(storageEnum)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLocalKind() {
        result := ComCall(6, this, "int*", &kind := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return kind
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetArgumentPosition() {
        result := ComCall(7, this, "uint*", &argPosition := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return argPosition
    }
}
