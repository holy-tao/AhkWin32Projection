#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class IWriteableBitmap extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWriteableBitmap
     * @type {Guid}
     */
    static IID => Guid("{bf0b7e6f-df7c-4a85-8413-a1216285835c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PixelBuffer", "Invalidate"]

    /**
     * @type {IBuffer} 
     */
    PixelBuffer {
        get => this.get_PixelBuffer()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_PixelBuffer() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * Enables the user to remove a single name and all associated data from the name cache.
     * @returns {HRESULT} Returns <b>TRUE</b> if the name and associated data are removed from the name cache; otherwise, it returns <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/filehc/nf-filehc-invalidatename
     */
    Invalidate() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
