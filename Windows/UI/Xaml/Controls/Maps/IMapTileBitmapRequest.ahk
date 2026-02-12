#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include .\MapTileBitmapRequestDeferral.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapTileBitmapRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapTileBitmapRequest
     * @type {Guid}
     */
    static IID => Guid("{46733fbc-d89d-472b-b5f6-d7066b0584f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PixelData", "put_PixelData", "GetDeferral"]

    /**
     * @type {IRandomAccessStreamReference} 
     */
    PixelData {
        get => this.get_PixelData()
        set => this.put_PixelData(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_PixelData() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_PixelData(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MapTileBitmapRequestDeferral} 
     */
    GetDeferral() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapTileBitmapRequestDeferral(result_)
    }
}
