#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IAnimationControllerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnimationControllerStatics
     * @type {Guid}
     */
    static IID => Guid("{e71164df-651b-4800-b9e5-6a3bcfed3365}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxPlaybackRate", "get_MinPlaybackRate"]

    /**
     * @type {Float} 
     */
    MaxPlaybackRate {
        get => this.get_MaxPlaybackRate()
    }

    /**
     * @type {Float} 
     */
    MinPlaybackRate {
        get => this.get_MinPlaybackRate()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxPlaybackRate() {
        result := ComCall(6, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinPlaybackRate() {
        result := ComCall(7, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
