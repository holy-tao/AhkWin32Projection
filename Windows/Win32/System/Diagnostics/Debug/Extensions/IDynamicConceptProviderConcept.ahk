#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDynamicConceptProviderConcept extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDynamicConceptProviderConcept
     * @type {Guid}
     */
    static IID => Guid("{95a7f7dd-602e-483f-9d06-a15c0ee13174}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConcept", "SetConcept", "NotifyParent", "NotifyParentChange", "NotifyDestruct"]

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {Pointer<Guid>} conceptId 
     * @param {Pointer<Pointer<IUnknown>>} conceptInterface 
     * @param {Pointer<Pointer<IKeyStore>>} conceptMetadata 
     * @param {Pointer<Boolean>} hasConcept 
     * @returns {HRESULT} 
     */
    GetConcept(contextObject, conceptId, conceptInterface, conceptMetadata, hasConcept) {
        hasConceptMarshal := hasConcept is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", contextObject, "ptr", conceptId, "ptr*", conceptInterface, "ptr*", conceptMetadata, hasConceptMarshal, hasConcept, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {Pointer<Guid>} conceptId 
     * @param {IUnknown} conceptInterface 
     * @param {IKeyStore} conceptMetadata 
     * @returns {HRESULT} 
     */
    SetConcept(contextObject, conceptId, conceptInterface, conceptMetadata) {
        result := ComCall(4, this, "ptr", contextObject, "ptr", conceptId, "ptr", conceptInterface, "ptr", conceptMetadata, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The NotifyParentalLevelChange method enables or disables the event handling for temporary parental management level commands.
     * @remarks
     * Parental management notifications are disabled by default. This means that temporary parental commands from the disc are allowed but ignored and disc will play without interruption. Call this method during initialization of your application if you need to handle temporary parental management level commands from the disc. To disable parental management after it is enabled, call this method with an argument of false. For more details on parental management, see [**AcceptParentalLevelChange**](acceptparentallevelchange-method.md).
     * @param {IModelObject} parentModel 
     * @returns {HRESULT} <span id="bNotify"></span><span id="bnotify"></span><span id="BNOTIFY"></span>*bNotify*
     * 
     * Specifies a Boolean value indicating whether or not the application is notified when the MSWebDVD object encounters video segments with a rating more restrictive than the overall rating for the disc.
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/notifyparentallevelchange-method
     */
    NotifyParent(parentModel) {
        result := ComCall(5, this, "ptr", parentModel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IModelObject} parentModel 
     * @returns {HRESULT} 
     */
    NotifyParentChange(parentModel) {
        result := ComCall(6, this, "ptr", parentModel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyDestruct() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
