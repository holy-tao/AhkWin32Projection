#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\WriteableBitmap.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class IWriteableBitmapFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWriteableBitmapFactory
     * @type {Guid}
     */
    static IID => Guid("{5563ebb1-3ef2-42c5-9c6d-1cf5dcc041ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithDimensions"]

    /**
     * 
     * @param {Integer} pixelWidth 
     * @param {Integer} pixelHeight 
     * @returns {WriteableBitmap} 
     */
    CreateInstanceWithDimensions(pixelWidth, pixelHeight) {
        result := ComCall(6, this, "int", pixelWidth, "int", pixelHeight, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WriteableBitmap(value)
    }
}
