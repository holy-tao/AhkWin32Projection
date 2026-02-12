#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AudioStreamDescriptor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IAudioStreamDescriptorFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioStreamDescriptorFactory
     * @type {Guid}
     */
    static IID => Guid("{4a86ce9e-4cb1-4380-8e0c-83504b7f5bf3}")

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
     * @param {AudioEncodingProperties} encodingProperties 
     * @returns {AudioStreamDescriptor} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(encodingProperties) {
        result := ComCall(6, this, "ptr", encodingProperties, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioStreamDescriptor(result_)
    }
}
