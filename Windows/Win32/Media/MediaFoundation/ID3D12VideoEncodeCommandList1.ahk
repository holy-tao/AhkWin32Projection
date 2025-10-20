#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoEncodeCommandList.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoEncodeCommandList1 extends ID3D12VideoEncodeCommandList{
    /**
     * The interface identifier for ID3D12VideoEncodeCommandList1
     * @type {Guid}
     */
    static IID => Guid("{94971eca-2bdb-4769-88cf-3675ea757ebc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * 
     * @param {Pointer<ID3D12VideoExtensionCommand>} pExtensionCommand 
     * @param {Pointer} pInitializationParameters 
     * @param {Pointer} InitializationParametersSizeInBytes 
     * @returns {String} Nothing - always returns an empty string
     */
    InitializeExtensionCommand(pExtensionCommand, pInitializationParameters, InitializationParametersSizeInBytes) {
        ComCall(25, this, "ptr", pExtensionCommand, "ptr", pInitializationParameters, "ptr", InitializationParametersSizeInBytes)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12VideoExtensionCommand>} pExtensionCommand 
     * @param {Pointer} pExecutionParameters 
     * @param {Pointer} ExecutionParametersSizeInBytes 
     * @returns {String} Nothing - always returns an empty string
     */
    ExecuteExtensionCommand(pExtensionCommand, pExecutionParameters, ExecutionParametersSizeInBytes) {
        ComCall(26, this, "ptr", pExtensionCommand, "ptr", pExecutionParameters, "ptr", ExecutionParametersSizeInBytes)
        return result
    }
}
