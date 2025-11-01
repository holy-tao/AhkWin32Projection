#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDMLDeviceChild.ahk

/**
 * Implemented by objects that can be evicted from GPU memory, and hence that can be supplied to IDMLDevice::Evict and IDMLDevice::MakeResident.
 * @see https://docs.microsoft.com/windows/win32/api//directml/nn-directml-idmlpageable
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class IDMLPageable extends IDMLDeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDMLPageable
     * @type {Guid}
     */
    static IID => Guid("{b1ab0825-4542-4a4b-8617-6dde6e8f6201}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
