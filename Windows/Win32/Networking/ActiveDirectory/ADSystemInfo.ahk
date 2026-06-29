#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IADsADSystemInfo interface retrieves data about the local computer if it is running a Windows operating system in a Windows domain. For example, you can get the domain, site, and distinguished name of the local computer.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsadsysteminfo
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADSystemInfo {
    #StructPack 1

}
