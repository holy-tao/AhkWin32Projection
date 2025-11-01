#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ISubunit interface represents a hardware subunit (for example, a volume control) that lies in the data path between a client and an audio endpoint device.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-isubunit
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISubunit extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISubunit
     * @type {Guid}
     */
    static IID => Guid("{82149a85-dba6-4487-86bb-ea8f7fefcc71}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
