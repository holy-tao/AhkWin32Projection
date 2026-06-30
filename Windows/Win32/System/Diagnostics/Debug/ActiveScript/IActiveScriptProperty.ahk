#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Variant\VARIANT.ahk
#Include ..\..\..\Com\IUnknown.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class IActiveScriptProperty extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptProperty
     * @type {Guid}
     */
    static IID => Guid("{4954e0d0-fbc7-11d1-8410-006008c3fbfc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperty", "SetProperty"]

    /**
     * The GetProperty function returns a handle to a given property.
     * @remarks
     * The **GetProperty** function can be used to obtain the property handle needed to locate instances of the property. The functions used to locate property instances are [FindPropertyInstance](findpropertyinstance.md) (which locates the first instance) and [FindPropertyInstanceRestart](findpropertyinstancerestart.md) (which locates the next instance).
     * 
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetProperty** function.
     * @param {Integer} dwProperty 
     * @param {Pointer<VARIANT>} pvarIndex 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/getproperty
     */
    GetProperty(dwProperty, pvarIndex) {
        pvarValue := VARIANT()
        result := ComCall(3, this, "uint", dwProperty, "ptr", pvarIndex, "ptr", pvarValue, "HRESULT")
        return pvarValue
    }

    /**
     * 
     * @param {Integer} dwProperty 
     * @param {Pointer<VARIANT>} pvarIndex 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    SetProperty(dwProperty, pvarIndex, pvarValue) {
        result := ComCall(4, this, "uint", dwProperty, "ptr", pvarIndex, "ptr", pvarValue, "HRESULT")
        return result
    }
}
