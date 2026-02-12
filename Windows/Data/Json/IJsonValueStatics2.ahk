#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\JsonValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Json
 * @version WindowsRuntime 1.4
 */
class IJsonValueStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJsonValueStatics2
     * @type {Guid}
     */
    static IID => Guid("{1d9ecbe4-3fe8-4335-8392-93d8e36865f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateNullValue"]

    /**
     * 
     * @returns {JsonValue} 
     */
    CreateNullValue() {
        result := ComCall(6, this, "ptr*", &jsonValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return JsonValue(jsonValue_)
    }
}
