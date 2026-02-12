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
class IInkSynchronizer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkSynchronizer
     * @type {Guid}
     */
    static IID => Guid("{9b9ea160-ae9b-45f9-8407-4b493b163661}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginDry", "EndDry"]

    /**
     * 
     * @returns {IVectorView<InkStroke>} 
     */
    BeginDry() {
        result := ComCall(6, this, "ptr*", &inkStrokes_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(InkStroke, inkStrokes_)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndDry() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
