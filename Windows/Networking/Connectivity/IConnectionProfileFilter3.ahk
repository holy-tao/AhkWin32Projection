#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class IConnectionProfileFilter3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnectionProfileFilter3
     * @type {Guid}
     */
    static IID => Guid("{0aaa09c0-5014-447c-8809-aee4cb0af94a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_PurposeGuid", "get_PurposeGuid"]

    /**
     * @type {IReference<Guid>} 
     */
    PurposeGuid {
        get => this.get_PurposeGuid()
        set => this.put_PurposeGuid(value)
    }

    /**
     * 
     * @param {IReference<Guid>} value 
     * @returns {HRESULT} 
     */
    put_PurposeGuid(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Guid>} 
     */
    get_PurposeGuid() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetGuid(), value)
    }
}
