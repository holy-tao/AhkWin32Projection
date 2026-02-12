#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeploymentWorkloadBatch.ahk
#Include .\IDeploymentWorkloadBatchFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class DeploymentWorkloadBatch extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeploymentWorkloadBatch

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeploymentWorkloadBatch.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} id 
     * @returns {DeploymentWorkloadBatch} 
     */
    static CreateInstance(id) {
        if (!DeploymentWorkloadBatch.HasProp("__IDeploymentWorkloadBatchFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Setup.DeploymentWorkloadBatch")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeploymentWorkloadBatchFactory.IID)
            DeploymentWorkloadBatch.__IDeploymentWorkloadBatchFactory := IDeploymentWorkloadBatchFactory(factoryPtr)
        }

        return DeploymentWorkloadBatch.__IDeploymentWorkloadBatchFactory.CreateInstance(id)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayCategoryTitle {
        get => this.get_DisplayCategoryTitle()
        set => this.put_DisplayCategoryTitle(value)
    }

    /**
     * @type {IVector<DeploymentWorkload>} 
     */
    BatchWorkloads {
        get => this.get_BatchWorkloads()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IDeploymentWorkloadBatch")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkloadBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkloadBatch := IDeploymentWorkloadBatch(outPtr)
        }

        return this.__IDeploymentWorkloadBatch.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayCategoryTitle() {
        if (!this.HasProp("__IDeploymentWorkloadBatch")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkloadBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkloadBatch := IDeploymentWorkloadBatch(outPtr)
        }

        return this.__IDeploymentWorkloadBatch.get_DisplayCategoryTitle()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayCategoryTitle(value) {
        if (!this.HasProp("__IDeploymentWorkloadBatch")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkloadBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkloadBatch := IDeploymentWorkloadBatch(outPtr)
        }

        return this.__IDeploymentWorkloadBatch.put_DisplayCategoryTitle(value)
    }

    /**
     * 
     * @returns {IVector<DeploymentWorkload>} 
     */
    get_BatchWorkloads() {
        if (!this.HasProp("__IDeploymentWorkloadBatch")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkloadBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkloadBatch := IDeploymentWorkloadBatch(outPtr)
        }

        return this.__IDeploymentWorkloadBatch.get_BatchWorkloads()
    }

;@endregion Instance Methods
}
