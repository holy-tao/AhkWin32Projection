#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of process that is identified in the D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS_OUTPUT structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_authenticated_process_identifier_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_AUTHENTICATED_PROCESS_IDENTIFIER_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Unknown process type.
     * @type {Integer (Int32)}
     */
    static D3D11_PROCESSIDTYPE_UNKNOWN => 0

    /**
     * Desktop Window Manager (DWM) process.
     * @type {Integer (Int32)}
     */
    static D3D11_PROCESSIDTYPE_DWM => 1

    /**
     * Handle to a process.
     * @type {Integer (Int32)}
     */
    static D3D11_PROCESSIDTYPE_HANDLE => 2
}
