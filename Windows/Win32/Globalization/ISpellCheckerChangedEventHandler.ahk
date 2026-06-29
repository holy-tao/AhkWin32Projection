#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpellChecker.ahk" { ISpellChecker }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows the caller to create a handler for notifications that the state of the speller has changed.
 * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nn-spellcheck-ispellcheckerchangedeventhandler
 * @namespace Windows.Win32.Globalization
 */
export default struct ISpellCheckerChangedEventHandler extends IUnknown {
    /**
     * The interface identifier for ISpellCheckerChangedEventHandler
     * @type {Guid}
     */
    static IID := Guid("{0b83a5b0-792f-4eab-9799-acf52c5ed08a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpellCheckerChangedEventHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Invoke : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpellCheckerChangedEventHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Receives the SpellCheckerChanged event.
     * @remarks
     * This method is called when there is a change to the state of the spell checker that could cause text to be treated differently. A client should recheck the text when this event is received.
     * @param {ISpellChecker} sender The <a href="https://docs.microsoft.com/windows/desktop/api/spellcheck/nn-spellcheck-ispellchecker">ISpellChecker</a> that fired the event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/spellcheck/nf-spellcheck-ispellcheckerchangedeventhandler-invoke
     */
    Invoke(sender) {
        result := ComCall(3, this, "ptr", sender, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpellCheckerChangedEventHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Invoke := CallbackCreate(GetMethod(implObj, "Invoke"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Invoke)
    }
}
