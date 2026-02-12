#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class IGameSaveBlobGetResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameSaveBlobGetResult
     * @type {Guid}
     */
    static IID => Guid("{917281e0-7201-4953-aa2c-4008f03aef45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_Value"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {IMapView<HSTRING, IBuffer>} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IBuffer>} 
     */
    get_Value() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), IBuffer, value)
    }
}
