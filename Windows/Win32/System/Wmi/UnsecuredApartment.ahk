#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IUnsecuredApartment interface is used to simplify the process of making asynchronous calls from a client process.
 * @remarks
 * <b>IUnsecuredApartment</b> allows WMI to create a separate process to handle callbacks. Using this interface creates security risks, as described in <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/setting-security-on-an-asynchronous-call">Setting Security on an Asynchronous Call</a>. Semisynchronous access or performing access checks are recommended instead of asynchronous calls. For more information and an example of using <b>IUnsecuredApartment</b>, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/lowering-the-security-for-a-sink-in-a-separate-process">Lowering the Security for a Sink in a Separate Process</a>. Use <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemunsecuredapartment">IWbemUnsecuredApartment::CreateSinkStub</a> for a more secure approach.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iunsecuredapartment
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class UnsecuredApartment extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
