#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class IPixelDataProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPixelDataProvider
     * @type {Guid}
     */
    static IID => Guid("{dd831f25-185c-4595-9fb9-ccbe6ec18a6f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DetachPixelData"]

    /**
     * 
     * @param {Pointer<Pointer>} pixelData 
     * @returns {HRESULT} 
     */
    DetachPixelData(pixelData) {
        result := ComCall(6, this, "ptr", pixelData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
