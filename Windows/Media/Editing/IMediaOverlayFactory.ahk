#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaOverlay.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class IMediaOverlayFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaOverlayFactory
     * @type {Guid}
     */
    static IID => Guid("{b584828a-6188-4f8f-a2e0-aa552d598e18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithPositionAndOpacity"]

    /**
     * Create Extended Stored Procedures
     * @param {MediaClip} clip 
     * @returns {MediaOverlay} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(clip) {
        result := ComCall(6, this, "ptr", clip, "ptr*", &mediaOverlay_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaOverlay(mediaOverlay_)
    }

    /**
     * 
     * @param {MediaClip} clip 
     * @param {RECT} position 
     * @param {Float} opacity 
     * @returns {MediaOverlay} 
     */
    CreateWithPositionAndOpacity(clip, position, opacity) {
        result := ComCall(7, this, "ptr", clip, "ptr", position, "double", opacity, "ptr*", &mediaOverlay_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaOverlay(mediaOverlay_)
    }
}
