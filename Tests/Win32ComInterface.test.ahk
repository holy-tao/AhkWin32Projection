#Requires AutoHotkey v2.0

#Include ./Yunit/Yunit.ahk
#Include ./YunitExtensions/Assert.ahk

#Include ../Win32ComInterface.ahk
#Include ../Windows/Win32/System/Com/IUnknown.ahk

Win32ComInterfaceTests().FunctionCount_Always_CountsAllFunctions()

class Win32ComInterfaceTests {

    /**
     * These also test the vtable creating and parameter marshalling, since the interface
     * methods are just wrappers for ComCall
     */
    class InterfaceImplementations {

        Implement_WithObject_CreatesInterfaceImplementation(){
            argActual := 0, noArgsCalled := false

            test := DummyInterface({
                TestNoArgs: (pThis, vtable) => noArgsCalled := true, 
                TestArg: (pThis, vtable, arg) => argActual := arg
            })
            
            test.TestNoArgs()
            test.TestArg(42)

            Assert.Equals(noArgsCalled, true)
            Assert.Equals(argActual, 42)
        }

        DefaultQueryInterface_WithTopLevelGuid_GetsInterface(){
            test := DummyInterface({
                TestNoArgs: (pThis, vtable) => FileAppend("Should not be called", "**"), 
                TestArg: (pThis, vtable, arg) => FileAppend("Should not be called", "**")
            })

            result := test.QueryInterface(DummyInterface.IID.ptr, &outPtr := 0)

            Assert.Equals(result, 0)             ; Should return S_OK
            Assert.Equals(test.RefCount, 2)      ; Assert that AddRef() was called
            Assert.Equals(outPtr, test.ptr)      ; Pointer should be a pointer to itself

            test.Release()
        }

        DefaultQueryInterface_WithIUnknownGuid_GetsInterface(){
            test := DummyInterface({
                TestNoArgs: (pThis, vtable) => FileAppend("Should not be called", "**"), 
                TestArg: (pThis, vtable, arg) => FileAppend("Should not be called", "**")
            })

            result := test.QueryInterface(IUnknown.IID, &outPtr := 0)

            Assert.Equals(result, 0)             ; Should return S_OK
            Assert.Equals(test.RefCount, 2)      ; Assert that AddRef() was called
            Assert.Equals(outPtr, test.ptr)      ; Pointer should be a pointer to itself

            test.Release()
        }

        DefaultQueryInterface_WithUnimplementedGuid_ReturnsENOINTERFACE(){
            static E_NOINTERFACE := 0x80004002

            test := DummyInterface({
                TestNoArgs: (pThis, vtable) => FileAppend("Should not be called", "**"), 
                TestArg: (pThis, vtable, arg) => FileAppend("Should not be called", "**")
            })

            result := test.QueryInterface(Guid.Create(), &outPtr := 0)
            result := result & 0x00000000FFFFFFFF   ; zero high bits, their value is arbitrary

            Assert.Equals(result, E_NOINTERFACE) ; Should return E_NOINTERFACE
            Assert.Equals(test.RefCount, 1)      ; Assert that AddRef() was not called
            Assert.Equals(outPtr, 0)             ; Pointer should be null

            test.Release()
        }

        Implement_WithMissingFunction_ThrowsMethodError(){
            Assert.Throws((*) => DummyInterface({TestNoArgs: (pThis, vtable) => 1 }), MethodError)
        }
    }

    FunctionCount_Always_CountsAllFunctions(){
        Assert.Equals(DummyInterface(0).FunctionCount(), 5)
        Assert.Equals(IUnknown(0).FunctionCount(), 3)
    }
}

class DummyInterface extends IUnknown {

        static sizeof => A_PtrSize

        static IID {
            get {
                if(!this.HasProp("__IID"))
                    this.__IID := Guid.Create()
                return this.__IID
            }
        }

        static vTableOffset => 3
        static VTableNames => ["TestNoArgs", "TestArg"]

        TestNoArgs(){
            return ComCall(3, this, "int")
        }

        TestArg(arg){
            return ComCall(4, this, "int", arg, "int")
        }
    }