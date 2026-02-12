#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\LearningModel.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ILearningModelStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelStatics
     * @type {Guid}
     */
    static IID => Guid("{e3b977e8-6952-4e47-8ef4-1f7f07897c6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadFromStorageFileAsync", "LoadFromStreamAsync", "LoadFromFilePath", "LoadFromStream", "LoadFromStorageFileWithOperatorProviderAsync", "LoadFromStreamWithOperatorProviderAsync", "LoadFromFilePathWithOperatorProvider", "LoadFromStreamWithOperatorProvider"]

    /**
     * 
     * @param {IStorageFile} modelFile 
     * @returns {IAsyncOperation<LearningModel>} 
     */
    LoadFromStorageFileAsync(modelFile) {
        result := ComCall(6, this, "ptr", modelFile, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LearningModel, operation)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} modelStream 
     * @returns {IAsyncOperation<LearningModel>} 
     */
    LoadFromStreamAsync(modelStream) {
        result := ComCall(7, this, "ptr", modelStream, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LearningModel, operation)
    }

    /**
     * 
     * @param {HSTRING} filePath 
     * @returns {LearningModel} 
     */
    LoadFromFilePath(filePath) {
        if(filePath is String) {
            pin := HSTRING.Create(filePath)
            filePath := pin.Value
        }
        filePath := filePath is Win32Handle ? NumGet(filePath, "ptr") : filePath

        result := ComCall(8, this, "ptr", filePath, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LearningModel(result_)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} modelStream 
     * @returns {LearningModel} 
     */
    LoadFromStream(modelStream) {
        result := ComCall(9, this, "ptr", modelStream, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LearningModel(result_)
    }

    /**
     * 
     * @param {IStorageFile} modelFile 
     * @param {ILearningModelOperatorProvider} operatorProvider 
     * @returns {IAsyncOperation<LearningModel>} 
     */
    LoadFromStorageFileWithOperatorProviderAsync(modelFile, operatorProvider) {
        result := ComCall(10, this, "ptr", modelFile, "ptr", operatorProvider, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LearningModel, operation)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} modelStream 
     * @param {ILearningModelOperatorProvider} operatorProvider 
     * @returns {IAsyncOperation<LearningModel>} 
     */
    LoadFromStreamWithOperatorProviderAsync(modelStream, operatorProvider) {
        result := ComCall(11, this, "ptr", modelStream, "ptr", operatorProvider, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LearningModel, operation)
    }

    /**
     * 
     * @param {HSTRING} filePath 
     * @param {ILearningModelOperatorProvider} operatorProvider 
     * @returns {LearningModel} 
     */
    LoadFromFilePathWithOperatorProvider(filePath, operatorProvider) {
        if(filePath is String) {
            pin := HSTRING.Create(filePath)
            filePath := pin.Value
        }
        filePath := filePath is Win32Handle ? NumGet(filePath, "ptr") : filePath

        result := ComCall(12, this, "ptr", filePath, "ptr", operatorProvider, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LearningModel(result_)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} modelStream 
     * @param {ILearningModelOperatorProvider} operatorProvider 
     * @returns {LearningModel} 
     */
    LoadFromStreamWithOperatorProvider(modelStream, operatorProvider) {
        result := ComCall(13, this, "ptr", modelStream, "ptr", operatorProvider, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LearningModel(result_)
    }
}
