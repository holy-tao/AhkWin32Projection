#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether the topology loader will insert hardware-based Media Foundation transforms (MFTs) into the topology.
 * @remarks
 * 
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-topology-hardware-mode">MF_TOPOLOGY_HARDWARE_MODE</a> topology attribute.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mftopology_hardware_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFTOPOLOGY_HARDWARE_MODE{

    /**
     * Use only software  MFTs. Do not use hardware-based MFTs. This mode is the default, for backward compatibility with existing applications.
     * @type {Integer (Int32)}
     */
    static MFTOPOLOGY_HWMODE_SOFTWARE_ONLY => 0

    /**
     * Use hardware-based MFTs when possible, and software MFTs otherwise. This mode is the recommended one.
     * @type {Integer (Int32)}
     */
    static MFTOPOLOGY_HWMODE_USE_HARDWARE => 1

    /**
     * If hardware-based MFTs are available, the topoloader will insert
 *     them.  If not, the connection will fail.
 * 
 * Supported in Windows 8.1 and later.
     * @type {Integer (Int32)}
     */
    static MFTOPOLOGY_HWMODE_USE_ONLY_HARDWARE => 2
}
