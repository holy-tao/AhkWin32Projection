#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ColorKeyFrameCollection.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IColorAnimationUsingKeyFrames extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColorAnimationUsingKeyFrames
     * @type {Guid}
     */
    static IID => Guid("{f5c82640-13c3-42aa-9ae2-7e6b51c92f95}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeyFrames", "get_EnableDependentAnimation", "put_EnableDependentAnimation"]

    /**
     * @type {ColorKeyFrameCollection} 
     */
    KeyFrames {
        get => this.get_KeyFrames()
    }

    /**
     * @type {Boolean} 
     */
    EnableDependentAnimation {
        get => this.get_EnableDependentAnimation()
        set => this.put_EnableDependentAnimation(value)
    }

    /**
     * 
     * @returns {ColorKeyFrameCollection} 
     */
    get_KeyFrames() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ColorKeyFrameCollection(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EnableDependentAnimation() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_EnableDependentAnimation(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
