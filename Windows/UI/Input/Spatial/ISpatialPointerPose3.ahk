#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Perception\People\EyesPose.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialPointerPose3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialPointerPose3
     * @type {Guid}
     */
    static IID => Guid("{6342f3f0-ec49-5b4b-b8d1-d16cbb16be84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Eyes", "get_IsHeadCapturedBySystem"]

    /**
     * @type {EyesPose} 
     */
    Eyes {
        get => this.get_Eyes()
    }

    /**
     * @type {Boolean} 
     */
    IsHeadCapturedBySystem {
        get => this.get_IsHeadCapturedBySystem()
    }

    /**
     * 
     * @returns {EyesPose} 
     */
    get_Eyes() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EyesPose(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHeadCapturedBySystem() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
