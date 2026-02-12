#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Graphics\Imaging\BitmapBounds.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.FaceAnalysis
 * @version WindowsRuntime 1.4
 */
class IDetectedFace extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDetectedFace
     * @type {Guid}
     */
    static IID => Guid("{8200d454-66bc-34df-9410-e89400195414}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FaceBox"]

    /**
     * @type {BitmapBounds} 
     */
    FaceBox {
        get => this.get_FaceBox()
    }

    /**
     * 
     * @returns {BitmapBounds} 
     */
    get_FaceBox() {
        returnValue := BitmapBounds()
        result := ComCall(6, this, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }
}
