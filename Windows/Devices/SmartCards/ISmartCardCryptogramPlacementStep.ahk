#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SmartCardCryptogramPlacementStep.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardCryptogramPlacementStep extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardCryptogramPlacementStep
     * @type {Guid}
     */
    static IID => Guid("{947b03eb-8342-4792-a2e5-925636378a53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Algorithm", "put_Algorithm", "get_SourceData", "put_SourceData", "get_CryptogramMaterialPackageName", "put_CryptogramMaterialPackageName", "get_CryptogramMaterialName", "put_CryptogramMaterialName", "get_TemplateOffset", "put_TemplateOffset", "get_CryptogramOffset", "put_CryptogramOffset", "get_CryptogramLength", "put_CryptogramLength", "get_CryptogramPlacementOptions", "put_CryptogramPlacementOptions", "get_ChainedOutputStep", "put_ChainedOutputStep"]

    /**
     * @type {Integer} 
     */
    Algorithm {
        get => this.get_Algorithm()
        set => this.put_Algorithm(value)
    }

    /**
     * @type {IBuffer} 
     */
    SourceData {
        get => this.get_SourceData()
        set => this.put_SourceData(value)
    }

    /**
     * @type {HSTRING} 
     */
    CryptogramMaterialPackageName {
        get => this.get_CryptogramMaterialPackageName()
        set => this.put_CryptogramMaterialPackageName(value)
    }

    /**
     * @type {HSTRING} 
     */
    CryptogramMaterialName {
        get => this.get_CryptogramMaterialName()
        set => this.put_CryptogramMaterialName(value)
    }

    /**
     * @type {Integer} 
     */
    TemplateOffset {
        get => this.get_TemplateOffset()
        set => this.put_TemplateOffset(value)
    }

    /**
     * @type {Integer} 
     */
    CryptogramOffset {
        get => this.get_CryptogramOffset()
        set => this.put_CryptogramOffset(value)
    }

    /**
     * @type {Integer} 
     */
    CryptogramLength {
        get => this.get_CryptogramLength()
        set => this.put_CryptogramLength(value)
    }

    /**
     * @type {Integer} 
     */
    CryptogramPlacementOptions {
        get => this.get_CryptogramPlacementOptions()
        set => this.put_CryptogramPlacementOptions(value)
    }

    /**
     * @type {SmartCardCryptogramPlacementStep} 
     */
    ChainedOutputStep {
        get => this.get_ChainedOutputStep()
        set => this.put_ChainedOutputStep(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Algorithm() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Algorithm(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_SourceData() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_SourceData(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CryptogramMaterialPackageName() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CryptogramMaterialPackageName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CryptogramMaterialName() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CryptogramMaterialName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TemplateOffset() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TemplateOffset(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CryptogramOffset() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CryptogramOffset(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CryptogramLength() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CryptogramLength(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CryptogramPlacementOptions() {
        result := ComCall(20, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CryptogramPlacementOptions(value) {
        result := ComCall(21, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SmartCardCryptogramPlacementStep} 
     */
    get_ChainedOutputStep() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmartCardCryptogramPlacementStep(value)
    }

    /**
     * 
     * @param {SmartCardCryptogramPlacementStep} value 
     * @returns {HRESULT} 
     */
    put_ChainedOutputStep(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
