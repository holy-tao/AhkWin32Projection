#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IDataPackagePropertySet4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataPackagePropertySet4
     * @type {Guid}
     */
    static IID => Guid("{6390ebf5-1739-4c74-b22f-865fab5e8545}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentSourceUserActivityJson", "put_ContentSourceUserActivityJson"]

    /**
     * @type {HSTRING} 
     */
    ContentSourceUserActivityJson {
        get => this.get_ContentSourceUserActivityJson()
        set => this.put_ContentSourceUserActivityJson(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentSourceUserActivityJson() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContentSourceUserActivityJson(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
