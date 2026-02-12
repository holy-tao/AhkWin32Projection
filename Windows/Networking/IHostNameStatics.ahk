#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking
 * @version WindowsRuntime 1.4
 */
class IHostNameStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostNameStatics
     * @type {Guid}
     */
    static IID => Guid("{f68cd4bf-a388-4e8b-91ea-54dd6dd901c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Compare"]

    /**
     * The CompareAddresses function compares two addresses, indicating that one of the addresses is greater than, less than, or equal to the other address.
     * @remarks
     * An address that is less than another address indicates a previous frame. An address that is greater than another address indicates a later frame.
     * 
     * Network Monitor provides two other functions, [CompareFrameDestAddress](compareframedestaddress.md) and [CompareFrameSourceAddress](compareframesourceaddress.md), which you can use to compare addresses. The **CompareFrameDestAddress** function compares a given address to the frame's destination address, and the **CompareFrameSourceAddress** function compares a given address to the frame's source address.
     * @param {HSTRING} value1 
     * @param {HSTRING} value2 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/compareaddresses
     */
    Compare(value1, value2) {
        if(value1 is String) {
            pin := HSTRING.Create(value1)
            value1 := pin.Value
        }
        value1 := value1 is Win32Handle ? NumGet(value1, "ptr") : value1
        if(value2 is String) {
            pin := HSTRING.Create(value2)
            value2 := pin.Value
        }
        value2 := value2 is Win32Handle ? NumGet(value2, "ptr") : value2

        result := ComCall(6, this, "ptr", value1, "ptr", value2, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
