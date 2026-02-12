#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\LearningModelPreview.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class ILearningModelPreviewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelPreviewStatics
     * @type {Guid}
     */
    static IID => Guid("{164bbb60-8465-4786-8b93-2c16a89289d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadModelFromStorageFileAsync", "LoadModelFromStreamAsync"]

    /**
     * 
     * @param {IStorageFile} modelFile 
     * @returns {IAsyncOperation<LearningModelPreview>} 
     */
    LoadModelFromStorageFileAsync(modelFile) {
        result := ComCall(6, this, "ptr", modelFile, "ptr*", &modelCreationOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LearningModelPreview, modelCreationOperation)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} modelStream 
     * @returns {IAsyncOperation<LearningModelPreview>} 
     */
    LoadModelFromStreamAsync(modelStream) {
        result := ComCall(7, this, "ptr", modelStream, "ptr*", &modelCreationOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LearningModelPreview, modelCreationOperation)
    }
}
