#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInferencingOptionsPreview.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * **Deprecated.** Represents the inference options for controlling the evaluation of a model.
 * @remarks
 * > [!Warning]
 * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.inferencingoptionspreview
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class InferencingOptionsPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInferencingOptionsPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInferencingOptionsPreview.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** Gets or sets the preferred device that the evaluation will be performed on.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.inferencingoptionspreview.preferreddevicekind
     * @type {Integer} 
     */
    PreferredDeviceKind {
        get => this.get_PreferredDeviceKind()
        set => this.put_PreferredDeviceKind(value)
    }

    /**
     * **Deprecated.** Gets or sets whether tracing is enabled during model evaluation.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.inferencingoptionspreview.istracingenabled
     * @type {Boolean} 
     */
    IsTracingEnabled {
        get => this.get_IsTracingEnabled()
        set => this.put_IsTracingEnabled(value)
    }

    /**
     * **Deprecated.** Gets or sets the maximum batch size for model evaluation.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.inferencingoptionspreview.maxbatchsize
     * @type {Integer} 
     */
    MaxBatchSize {
        get => this.get_MaxBatchSize()
        set => this.put_MaxBatchSize(value)
    }

    /**
     * **Deprecated.** Gets or sets whether to minimize memory allocation after model evaluation.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.inferencingoptionspreview.minimizememoryallocation
     * @type {Boolean} 
     */
    MinimizeMemoryAllocation {
        get => this.get_MinimizeMemoryAllocation()
        set => this.put_MinimizeMemoryAllocation(value)
    }

    /**
     * **Deprecated.** Gets or sets whether to reclaim allocated memory after the model evaluation.
     * @remarks
     * > [!Warning]
     * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.inferencingoptionspreview.reclaimmemoryafterevaluation
     * @type {Boolean} 
     */
    ReclaimMemoryAfterEvaluation {
        get => this.get_ReclaimMemoryAfterEvaluation()
        set => this.put_ReclaimMemoryAfterEvaluation(value)
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
    get_PreferredDeviceKind() {
        if (!this.HasProp("__IInferencingOptionsPreview")) {
            if ((queryResult := this.QueryInterface(IInferencingOptionsPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInferencingOptionsPreview := IInferencingOptionsPreview(outPtr)
        }

        return this.__IInferencingOptionsPreview.get_PreferredDeviceKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PreferredDeviceKind(value) {
        if (!this.HasProp("__IInferencingOptionsPreview")) {
            if ((queryResult := this.QueryInterface(IInferencingOptionsPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInferencingOptionsPreview := IInferencingOptionsPreview(outPtr)
        }

        return this.__IInferencingOptionsPreview.put_PreferredDeviceKind(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTracingEnabled() {
        if (!this.HasProp("__IInferencingOptionsPreview")) {
            if ((queryResult := this.QueryInterface(IInferencingOptionsPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInferencingOptionsPreview := IInferencingOptionsPreview(outPtr)
        }

        return this.__IInferencingOptionsPreview.get_IsTracingEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTracingEnabled(value) {
        if (!this.HasProp("__IInferencingOptionsPreview")) {
            if ((queryResult := this.QueryInterface(IInferencingOptionsPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInferencingOptionsPreview := IInferencingOptionsPreview(outPtr)
        }

        return this.__IInferencingOptionsPreview.put_IsTracingEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxBatchSize() {
        if (!this.HasProp("__IInferencingOptionsPreview")) {
            if ((queryResult := this.QueryInterface(IInferencingOptionsPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInferencingOptionsPreview := IInferencingOptionsPreview(outPtr)
        }

        return this.__IInferencingOptionsPreview.get_MaxBatchSize()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxBatchSize(value) {
        if (!this.HasProp("__IInferencingOptionsPreview")) {
            if ((queryResult := this.QueryInterface(IInferencingOptionsPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInferencingOptionsPreview := IInferencingOptionsPreview(outPtr)
        }

        return this.__IInferencingOptionsPreview.put_MaxBatchSize(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MinimizeMemoryAllocation() {
        if (!this.HasProp("__IInferencingOptionsPreview")) {
            if ((queryResult := this.QueryInterface(IInferencingOptionsPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInferencingOptionsPreview := IInferencingOptionsPreview(outPtr)
        }

        return this.__IInferencingOptionsPreview.get_MinimizeMemoryAllocation()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MinimizeMemoryAllocation(value) {
        if (!this.HasProp("__IInferencingOptionsPreview")) {
            if ((queryResult := this.QueryInterface(IInferencingOptionsPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInferencingOptionsPreview := IInferencingOptionsPreview(outPtr)
        }

        return this.__IInferencingOptionsPreview.put_MinimizeMemoryAllocation(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ReclaimMemoryAfterEvaluation() {
        if (!this.HasProp("__IInferencingOptionsPreview")) {
            if ((queryResult := this.QueryInterface(IInferencingOptionsPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInferencingOptionsPreview := IInferencingOptionsPreview(outPtr)
        }

        return this.__IInferencingOptionsPreview.get_ReclaimMemoryAfterEvaluation()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ReclaimMemoryAfterEvaluation(value) {
        if (!this.HasProp("__IInferencingOptionsPreview")) {
            if ((queryResult := this.QueryInterface(IInferencingOptionsPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInferencingOptionsPreview := IInferencingOptionsPreview(outPtr)
        }

        return this.__IInferencingOptionsPreview.put_ReclaimMemoryAfterEvaluation(value)
    }

;@endregion Instance Methods
}
