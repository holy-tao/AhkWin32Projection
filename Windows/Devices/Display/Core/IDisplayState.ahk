#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\DisplayTarget.ahk
#Include .\DisplayView.ahk
#Include ..\..\..\Foundation\Collections\IMap.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\DisplayPath.ahk
#Include .\DisplayStateOperationResult.ahk
#Include .\DisplayState.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayState extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayState
     * @type {Guid}
     */
    static IID => Guid("{08129321-11b5-5cb2-99f8-e90b479a8a1d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsReadOnly", "get_IsStale", "get_Targets", "get_Views", "get_Properties", "ConnectTarget", "ConnectTargetToView", "CanConnectTargetToView", "GetViewForTarget", "GetPathForTarget", "DisconnectTarget", "TryFunctionalize", "TryApply", "Clone"]

    /**
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

    /**
     * @type {Boolean} 
     */
    IsStale {
        get => this.get_IsStale()
    }

    /**
     * @type {IVectorView<DisplayTarget>} 
     */
    Targets {
        get => this.get_Targets()
    }

    /**
     * @type {IVectorView<DisplayView>} 
     */
    Views {
        get => this.get_Views()
    }

    /**
     * @type {IMap<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStale() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<DisplayTarget>} 
     */
    get_Targets() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(DisplayTarget, value)
    }

    /**
     * 
     * @returns {IVectorView<DisplayView>} 
     */
    get_Views() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(DisplayView, value)
    }

    /**
     * 
     * @returns {IMap<Guid, IInspectable>} 
     */
    get_Properties() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => IPropertyValue(ptr).GetGuid(), IInspectable, value)
    }

    /**
     * 
     * @param {DisplayTarget} target 
     * @returns {DisplayPath} 
     */
    ConnectTarget(target) {
        result := ComCall(11, this, "ptr", target, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayPath(result_)
    }

    /**
     * 
     * @param {DisplayTarget} target 
     * @param {DisplayView} view_ 
     * @returns {DisplayPath} 
     */
    ConnectTargetToView(target, view_) {
        result := ComCall(12, this, "ptr", target, "ptr", view_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayPath(result_)
    }

    /**
     * 
     * @param {DisplayTarget} target 
     * @param {DisplayView} view_ 
     * @returns {Boolean} 
     */
    CanConnectTargetToView(target, view_) {
        result := ComCall(13, this, "ptr", target, "ptr", view_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DisplayTarget} target 
     * @returns {DisplayView} 
     */
    GetViewForTarget(target) {
        result := ComCall(14, this, "ptr", target, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayView(result_)
    }

    /**
     * 
     * @param {DisplayTarget} target 
     * @returns {DisplayPath} 
     */
    GetPathForTarget(target) {
        result := ComCall(15, this, "ptr", target, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayPath(result_)
    }

    /**
     * 
     * @param {DisplayTarget} target 
     * @returns {HRESULT} 
     */
    DisconnectTarget(target) {
        result := ComCall(16, this, "ptr", target, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {DisplayStateOperationResult} 
     */
    TryFunctionalize(options) {
        result := ComCall(17, this, "uint", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayStateOperationResult(result_)
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {DisplayStateOperationResult} 
     */
    TryApply(options) {
        result := ComCall(18, this, "uint", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayStateOperationResult(result_)
    }

    /**
     * Clone Method Example (VC++)
     * @returns {DisplayState} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clone-method-example-vc
     */
    Clone() {
        result := ComCall(19, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayState(result_)
    }
}
