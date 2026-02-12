#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\NotesWindowManagerPreview.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Preview.Notes
 * @version WindowsRuntime 1.4
 */
class INotesWindowManagerPreviewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INotesWindowManagerPreviewStatics
     * @type {Guid}
     */
    static IID => Guid("{6668cc88-0a8e-4127-a38e-995445868a78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForCurrentApp"]

    /**
     * 
     * @returns {NotesWindowManagerPreview} 
     */
    GetForCurrentApp() {
        result := ComCall(6, this, "ptr*", &current := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NotesWindowManagerPreview(current)
    }
}
