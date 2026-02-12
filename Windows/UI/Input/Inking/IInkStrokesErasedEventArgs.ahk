#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\InkStroke.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkStrokesErasedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkStrokesErasedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{a4216a22-1503-4ebf-8ff5-2de84584a8aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Strokes"]

    /**
     * @type {IVectorView<InkStroke>} 
     */
    Strokes {
        get => this.get_Strokes()
    }

    /**
     * 
     * @returns {IVectorView<InkStroke>} 
     */
    get_Strokes() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(InkStroke, value)
    }
}
