#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInspectable.ahk" { IInspectable }

/**
 * Enables classes to be activated by the Windows Runtime.
 * @remarks
 * Implement the <b>IActivationFactory</b> interface when you create a class that you want Windows Runtime  applications to use. Clients call the <a href="https://docs.microsoft.com/windows/desktop/api/activation/nf-activation-iactivationfactory-activateinstance">ActivateInstance</a> method to use an instance of your class. 
 * 
 * You can get an <b>IActivationFactory</b> pointer by calling the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/nf-roapi-rogetactivationfactory">RoGetActivationFactory</a> function.  
 * 
 * During activation of a class, the Windows Runtime calls the <a href="https://docs.microsoft.com/previous-versions/br205771(v=vs.85)">DllGetActivationFactory</a> function to get an <b>IActivationFactory</b> pointer that corresponds to the requested class.
 * @see https://learn.microsoft.com/windows/win32/api/activation/nn-activation-iactivationfactory
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IActivationFactory extends IInspectable {
    /**
     * The interface identifier for IActivationFactory
     * @type {Guid}
     */
    static IID := Guid("{00000035-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActivationFactory interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        ActivateInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActivationFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new instance of the Windows Runtime class that is associated with the current activation factory.
     * @remarks
     * Use the <b>ActivateInstance</b> function to activate a Windows Runtime class. The <b>ActivateInstance</b> function connects to the activation factory that is associated with the specified activatable class identifier, creates an instance by calling the zero-argument constructor on the class, and releases the activation factory.
     * @returns {IInspectable} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a>**</b>
     * 
     * A pointer to a new instance of the class that is associated with the current activation factory.
     * @see https://learn.microsoft.com/windows/win32/api/activation/nf-activation-iactivationfactory-activateinstance
     */
    ActivateInstance() {
        result := ComCall(6, this, "ptr*", &instance := 0, "HRESULT")
        return IInspectable(instance)
    }

    Query(iid) {
        if (IActivationFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ActivateInstance := CallbackCreate(GetMethod(implObj, "ActivateInstance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ActivateInstance)
    }
}
