#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInputObject.ahk

/**
 * Exposes a method that extends IInputObject by handling global accelerators.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iinputobject">IInputObject</a> interface, from which it inherits.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iinputobject2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IInputObject2 extends IInputObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputObject2
     * @type {Guid}
     */
    static IID => Guid("{6915c085-510b-44cd-94af-28dfa56cf92b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TranslateAcceleratorGlobal"]

    /**
     * 
     * @param {Pointer<MSG>} pMsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iinputobject2-translateacceleratorglobal
     */
    TranslateAcceleratorGlobal(pMsg) {
        result := ComCall(6, this, "ptr", pMsg, "HRESULT")
        return result
    }
}
