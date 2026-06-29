#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDataModelScript.ahk" { IDataModelScript }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDataModelScriptDebugVariableSetEnumerator.ahk" { IDataModelScriptDebugVariableSetEnumerator }
#Import ".\ScriptDebugPosition.ahk" { ScriptDebugPosition }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelScriptDebugStackFrame extends IUnknown {
    /**
     * The interface identifier for IDataModelScriptDebugStackFrame
     * @type {Guid}
     */
    static IID := Guid("{dec6ed5e-6360-4941-ab4c-a26409de4f82}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelScriptDebugStackFrame interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetName            : IntPtr
        GetPosition        : IntPtr
        IsTransitionPoint  : IntPtr
        GetTransition      : IntPtr
        Evaluate           : IntPtr
        EnumerateLocals    : IntPtr
        EnumerateArguments : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelScriptDebugStackFrame.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        name := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * 
     * @param {Pointer<ScriptDebugPosition>} position 
     * @param {Pointer<ScriptDebugPosition>} positionSpanEnd 
     * @param {Pointer<BSTR>} lineText 
     * @returns {HRESULT} 
     */
    GetPosition(position, positionSpanEnd, lineText) {
        result := ComCall(4, this, ScriptDebugPosition.Ptr, position, ScriptDebugPosition.Ptr, positionSpanEnd, BSTR.Ptr, lineText, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsTransitionPoint() {
        result := ComCall(5, this, "int*", &isTransitionPoint := 0, "HRESULT")
        return isTransitionPoint
    }

    /**
     * 
     * @param {Pointer<IDataModelScript>} transitionScript 
     * @param {Pointer<Boolean>} isTransitionContiguous 
     * @returns {HRESULT} 
     */
    GetTransition(transitionScript, isTransitionContiguous) {
        isTransitionContiguousMarshal := isTransitionContiguous is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, IDataModelScript.Ptr, transitionScript, isTransitionContiguousMarshal, isTransitionContiguous, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszExpression 
     * @returns {IModelObject} 
     */
    Evaluate(pwszExpression) {
        pwszExpression := pwszExpression is String ? StrPtr(pwszExpression) : pwszExpression

        result := ComCall(7, this, "ptr", pwszExpression, "ptr*", &ppResult := 0, "HRESULT")
        return IModelObject(ppResult)
    }

    /**
     * 
     * @returns {IDataModelScriptDebugVariableSetEnumerator} 
     */
    EnumerateLocals() {
        result := ComCall(8, this, "ptr*", &variablesEnum := 0, "HRESULT")
        return IDataModelScriptDebugVariableSetEnumerator(variablesEnum)
    }

    /**
     * 
     * @returns {IDataModelScriptDebugVariableSetEnumerator} 
     */
    EnumerateArguments() {
        result := ComCall(9, this, "ptr*", &variablesEnum := 0, "HRESULT")
        return IDataModelScriptDebugVariableSetEnumerator(variablesEnum)
    }

    Query(iid) {
        if (IDataModelScriptDebugStackFrame.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetPosition := CallbackCreate(GetMethod(implObj, "GetPosition"), flags, 4)
        this.vtbl.IsTransitionPoint := CallbackCreate(GetMethod(implObj, "IsTransitionPoint"), flags, 2)
        this.vtbl.GetTransition := CallbackCreate(GetMethod(implObj, "GetTransition"), flags, 3)
        this.vtbl.Evaluate := CallbackCreate(GetMethod(implObj, "Evaluate"), flags, 3)
        this.vtbl.EnumerateLocals := CallbackCreate(GetMethod(implObj, "EnumerateLocals"), flags, 2)
        this.vtbl.EnumerateArguments := CallbackCreate(GetMethod(implObj, "EnumerateArguments"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetPosition)
        CallbackFree(this.vtbl.IsTransitionPoint)
        CallbackFree(this.vtbl.GetTransition)
        CallbackFree(this.vtbl.Evaluate)
        CallbackFree(this.vtbl.EnumerateLocals)
        CallbackFree(this.vtbl.EnumerateArguments)
    }
}
