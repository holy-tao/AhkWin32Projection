#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ITextRange.ahk

/**
 * A text selection is a text range with selection highlighting.
 * @remarks
 * 
  * The selection is associated with some kind of view, and has some UI-oriented methods that allow one to emulate keyboard input. Thus, an application can use the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> methods on a text selection, as well as the <b>ITextSelection</b> methods.
  * 
  * For keyboard input emulation, ranges used in selections use the concept of the <i>active end</i>, which is typically the end that was last moved. For example, if an <b>ITextRange::Move</b>* method operates on a range that is actually a text selection, the most recently moved end is the active one. The most familiar examples of the active end are those involving Shift+Arrow Key handling, where the active end is the one that moves. Accordingly, the <b>ITextSelection</b> methods include move methods for the active end, such as <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveleft">MoveLeft</a> or <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveright">MoveRight</a>, and methods to get and set the active end status. These methods manipulate selections in ways similar to the standard cursor-keypad operations. This allows you to implement, for example, a macro recorder facility.
  * 
  * To see how the cursor-keypad methods work, see the following table. A given method corresponds to a cursor-keypad key with the Ctrl and Shift keys. The <i>Unit</i> parameter is selected by pressing or not pressing the Ctrl key, while the <i>Extend</i> parameter is selected by pressing or not pressing the Shift key. Note, <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveup">MoveUp</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-movedown">MoveDown</a> correspond to more than one keypad key. For more information, see the descriptions of the methods.
  * 
  * <table class="clsStd">
  * <tr>
  * <th>Method</th>
  * <th>Cursor-keypad key</th>
  * <th>Unit given by CTRL pressed (not pressed)</th>
  * <th>Extend given by SHIFT pressed (not pressed)</th>
  * </tr>
  * <tr>
  * <td>EndKey</td>
  * <td>End</td>
  * <td>tomStory (tomLine)</td>
  * <td>tomExtend (tomMove)</td>
  * </tr>
  * <tr>
  * <td>HomeKey</td>
  * <td>Home</td>
  * <td>tomStory (tomLine)</td>
  * <td>tomExtend (tomMove)</td>
  * </tr>
  * <tr>
  * <td>MoveLeft</td>
  * <td>Left Arrow</td>
  * <td>tomWord (tomCharacter)</td>
  * <td>tomExtend (tomMove)</td>
  * </tr>
  * <tr>
  * <td>MoveRight</td>
  * <td>Right Arrow</td>
  * <td>tomWord (tomCharacter)</td>
  * <td>tomExtend (tomMove)</td>
  * </tr>
  * <tr>
  * <td>MoveUp</td>
  * <td>Up Arrow</td>
  * <td>tomParagraph (tomLine)</td>
  * <td>tomExtend (tomMove)</td>
  * </tr>
  * <tr>
  * <td>MoveDown</td>
  * <td>Down Arrow</td>
  * <td>tomParagraph (tomLine)</td>
  * <td>tomExtend (tomMove)</td>
  * </tr>
  * <tr>
  * <td>MoveUp</td>
  * <td>Page Up</td>
  * <td>tomWindow (tomScreen)</td>
  * <td>tomExtend (tomMove)</td>
  * </tr>
  * <tr>
  * <td>MoveDown</td>
  * <td>Page Down</td>
  * <td>tomWindow (tomScreen)</td>
  * <td>tomExtend (tomMove)</td>
  * </tr>
  * </table>
  *  
  * 
  * Applications typically do not implement the <b>ITextSelection</b> interface. Instead, Microsoft text solutions such as rich edit controls implement <b>ITextSelection</b> as part of their Text Object Model (TOM) implementation.
  * 
  * Applications can retrieve an <b>ITextSelection</b> pointer by calling the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextdocument-getselection">GetSelection</a> method.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextselection
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextSelection extends ITextRange{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextSelection
     * @type {Guid}
     */
    static IID => Guid("{8cc497c1-a1df-11ce-8098-00aa0047be5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 58

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFlags", "SetFlags", "GetType", "MoveLeft", "MoveRight", "MoveUp", "MoveDown", "HomeKey", "EndKey", "TypeText"]

    /**
     * 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-getflags
     */
    GetFlags(pFlags) {
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(58, this, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * Specifies how the recognizer interprets the ink and determines the result string.Call this function before processing the ink for the first time. Therefore, call the SetFlags function before calling the Process function.
     * @param {Integer} Flags 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>HRESULT value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is invalid or one of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-setflags
     */
    SetFlags(Flags) {
        result := ComCall(59, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-gettype
     */
    GetType(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(60, this, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Unit 
     * @param {Integer} Count 
     * @param {Integer} Extend 
     * @param {Pointer<Integer>} pDelta 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-moveleft
     */
    MoveLeft(Unit, Count, Extend, pDelta) {
        pDeltaMarshal := pDelta is VarRef ? "int*" : "ptr"

        result := ComCall(61, this, "int", Unit, "int", Count, "int", Extend, pDeltaMarshal, pDelta, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Unit 
     * @param {Integer} Count 
     * @param {Integer} Extend 
     * @param {Pointer<Integer>} pDelta 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-moveright
     */
    MoveRight(Unit, Count, Extend, pDelta) {
        pDeltaMarshal := pDelta is VarRef ? "int*" : "ptr"

        result := ComCall(62, this, "int", Unit, "int", Count, "int", Extend, pDeltaMarshal, pDelta, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Unit 
     * @param {Integer} Count 
     * @param {Integer} Extend 
     * @param {Pointer<Integer>} pDelta 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-moveup
     */
    MoveUp(Unit, Count, Extend, pDelta) {
        pDeltaMarshal := pDelta is VarRef ? "int*" : "ptr"

        result := ComCall(63, this, "int", Unit, "int", Count, "int", Extend, pDeltaMarshal, pDelta, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Unit 
     * @param {Integer} Count 
     * @param {Integer} Extend 
     * @param {Pointer<Integer>} pDelta 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-movedown
     */
    MoveDown(Unit, Count, Extend, pDelta) {
        pDeltaMarshal := pDelta is VarRef ? "int*" : "ptr"

        result := ComCall(64, this, "int", Unit, "int", Count, "int", Extend, pDeltaMarshal, pDelta, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Unit 
     * @param {Integer} Extend 
     * @param {Pointer<Integer>} pDelta 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-homekey
     */
    HomeKey(Unit, Extend, pDelta) {
        pDeltaMarshal := pDelta is VarRef ? "int*" : "ptr"

        result := ComCall(65, this, "int", Unit, "int", Extend, pDeltaMarshal, pDelta, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Unit 
     * @param {Integer} Extend 
     * @param {Pointer<Integer>} pDelta 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-endkey
     */
    EndKey(Unit, Extend, pDelta) {
        pDeltaMarshal := pDelta is VarRef ? "int*" : "ptr"

        result := ComCall(66, this, "int", Unit, "int", Extend, pDeltaMarshal, pDelta, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-typetext
     */
    TypeText(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(67, this, "ptr", bstr, "HRESULT")
        return result
    }
}
