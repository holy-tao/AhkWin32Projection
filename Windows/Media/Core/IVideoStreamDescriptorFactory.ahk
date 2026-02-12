#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VideoStreamDescriptor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IVideoStreamDescriptorFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoStreamDescriptorFactory
     * @type {Guid}
     */
    static IID => Guid("{494ef6d1-bb75-43d2-9e5e-7b79a3afced4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {VideoEncodingProperties} encodingProperties 
     * @returns {VideoStreamDescriptor} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(encodingProperties) {
        result := ComCall(6, this, "ptr", encodingProperties, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoStreamDescriptor(result_)
    }
}
