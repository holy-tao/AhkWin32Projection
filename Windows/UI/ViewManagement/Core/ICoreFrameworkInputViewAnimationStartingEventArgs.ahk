#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\CoreInputViewOcclusion.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class ICoreFrameworkInputViewAnimationStartingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreFrameworkInputViewAnimationStartingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{c0ec901c-bba4-501b-ae8b-65c9e756a719}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Occlusions", "get_FrameworkAnimationRecommended", "get_AnimationDuration"]

    /**
     * @type {IVectorView<CoreInputViewOcclusion>} 
     */
    Occlusions {
        get => this.get_Occlusions()
    }

    /**
     * @type {Boolean} 
     */
    FrameworkAnimationRecommended {
        get => this.get_FrameworkAnimationRecommended()
    }

    /**
     * @type {TimeSpan} 
     */
    AnimationDuration {
        get => this.get_AnimationDuration()
    }

    /**
     * 
     * @returns {IVectorView<CoreInputViewOcclusion>} 
     */
    get_Occlusions() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(CoreInputViewOcclusion, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_FrameworkAnimationRecommended() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_AnimationDuration() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
