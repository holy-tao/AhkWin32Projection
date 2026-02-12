#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Graphics\Imaging\SoftwareBitmap.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ILowLightFusionResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILowLightFusionResult
     * @type {Guid}
     */
    static IID => Guid("{78edbe35-27a0-42e0-9cd3-738d2089de9c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Frame"]

    /**
     * @type {SoftwareBitmap} 
     */
    Frame {
        get => this.get_Frame()
    }

    /**
     * 
     * @returns {SoftwareBitmap} 
     */
    get_Frame() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SoftwareBitmap(value)
    }
}
