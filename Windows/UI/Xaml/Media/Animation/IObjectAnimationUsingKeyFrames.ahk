#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ObjectKeyFrameCollection.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IObjectAnimationUsingKeyFrames extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectAnimationUsingKeyFrames
     * @type {Guid}
     */
    static IID => Guid("{334a2d92-b74a-4c64-b9a6-58bcfa314f22}")

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
     * @type {ObjectKeyFrameCollection} 
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
     * @returns {ObjectKeyFrameCollection} 
     */
    get_KeyFrames() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ObjectKeyFrameCollection(value)
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
