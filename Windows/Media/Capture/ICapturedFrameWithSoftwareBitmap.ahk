#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Graphics\Imaging\SoftwareBitmap.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class ICapturedFrameWithSoftwareBitmap extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICapturedFrameWithSoftwareBitmap
     * @type {Guid}
     */
    static IID => Guid("{b58e8b6e-8503-49b5-9e86-897d26a3ff3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SoftwareBitmap"]

    /**
     * @type {SoftwareBitmap} 
     */
    SoftwareBitmap {
        get => this.get_SoftwareBitmap()
    }

    /**
     * 
     * @returns {SoftwareBitmap} 
     */
    get_SoftwareBitmap() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SoftwareBitmap(value)
    }
}
