#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the different types of WinML runtimes.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ne-winml-winml_runtime_type
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct WINML_RUNTIME_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Runtime type of CNTK.
     * @type {Integer (Int32)}
     */
    static WINML_RUNTIME_CNTK => 0
}
