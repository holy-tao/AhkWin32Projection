#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Lights.Effects
 * @version WindowsRuntime 1.4
 */
class ILampArrayBitmapRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILampArrayBitmapRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{c8b4af9e-fe63-4d51-babd-619defb454ba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SinceStarted", "UpdateBitmap"]

    /**
     * @type {TimeSpan} 
     */
    SinceStarted {
        get => this.get_SinceStarted()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SinceStarted() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SoftwareBitmap} bitmap_ 
     * @returns {HRESULT} 
     */
    UpdateBitmap(bitmap_) {
        result := ComCall(7, this, "ptr", bitmap_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
