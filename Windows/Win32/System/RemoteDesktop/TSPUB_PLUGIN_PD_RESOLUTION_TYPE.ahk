#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of personal desktop resolution being requested.
 * @see https://learn.microsoft.com/windows/win32/api/tspubplugin2com/ne-tspubplugin2com-tspub_plugin_pd_resolution_type
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct TSPUB_PLUGIN_PD_RESOLUTION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Resolve an existing personal desktop for the user. If no personal desktop exists, the <a href="https://docs.microsoft.com/windows/desktop/api/tspubplugin2com/nf-tspubplugin2com-itspubplugin2-resolvepersonaldesktop">ResolvePersonalDesktop</a> method should create a new one.
     * @type {Integer (Int32)}
     */
    static TSPUB_PLUGIN_PD_QUERY_OR_CREATE => 0

    /**
     * Resolve an existing personal desktop for the user. If no personal desktop exists, the <a href="https://docs.microsoft.com/windows/desktop/api/tspubplugin2com/nf-tspubplugin2com-itspubplugin2-resolvepersonaldesktop">ResolvePersonalDesktop</a> method should return an error code.
     * @type {Integer (Int32)}
     */
    static TSPUB_PLUGIN_PD_QUERY_EXISTING => 1
}
