#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SpatialInteractionSourceState.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables interoperability with a WinRT SpatialInteractionManager object and provides access to SpatialInteractionManager members for accessing user input from hands, motion controllers, and system voice commands.
 * @see https://learn.microsoft.com/windows/win32/api//content/spatialinteractionmanagerinterop/nn-spatialinteractionmanagerinterop-ispatialinteractionmanagerinterop
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialInteraction extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialInteraction
     * @type {Guid}
     */
    static IID => Guid("{fc967639-88e6-4646-9112-4344aaec9dfa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceState"]

    /**
     * @type {SpatialInteractionSourceState} 
     */
    SourceState {
        get => this.get_SourceState()
    }

    /**
     * 
     * @returns {SpatialInteractionSourceState} 
     */
    get_SourceState() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialInteractionSourceState(value)
    }
}
