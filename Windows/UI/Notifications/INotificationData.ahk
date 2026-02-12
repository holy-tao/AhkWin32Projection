#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class INotificationData extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INotificationData
     * @type {Guid}
     */
    static IID => Guid("{9ffd2312-9d6a-4aaf-b6ac-ff17f0c1f280}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Values", "get_SequenceNumber", "put_SequenceNumber"]

    /**
     * @type {IMap<HSTRING, HSTRING>} 
     */
    Values {
        get => this.get_Values()
    }

    /**
     * @type {Integer} 
     */
    SequenceNumber {
        get => this.get_SequenceNumber()
        set => this.put_SequenceNumber(value)
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_Values() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SequenceNumber() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SequenceNumber(value) {
        result := ComCall(8, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
