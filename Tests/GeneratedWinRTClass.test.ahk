#Requires AutoHotkey v2.0

#Include .\Yunit\Yunit.ahk
#Include .\YunitExtensions\Assert.ahk
#Include .\Yunit\Stdout.ahk
#Include .\YunitExtensions\DetailedStdOut.ahk

#Include ../Windows/Data/Xml/Dom/XmlLoadSettings.ahk
#Include ../Windows/Data/Json/JsonValue.ahk
#Include ../Windows/Data/Json/JsonValueType.ahk
#Include ../Windows/Data/Json/JsonArray.ahk
#Include ../Windows/Foundation/AsyncActionCompletedHandler.ahk
#Include ../Windows/Foundation/Uri.ahk
#Include ../Windows/Foundation/Collections/PropertySet.ahk
#Include ../Windows/Foundation/Collections/StringMap.ahk
#Include ../Windows/Foundation/PropertyValue.ahk
#Include ../Windows/Foundation/Diagnostics/ErrorDetails.ahk
#Include ../Windows/Storage/StorageFile.ahk

#Include ../Windows/UI/Xaml/Controls/Button.ahk
#Include ../Windows/UI/Xaml/Markup/XamlReader.ahk
#Include ../Windows/UI/Xaml/Hosting/WindowsXamlManager.ahk

#Include ../Windows/Win32/System/WinRT/Apis.ahk
#Include ../Windows/Win32/System/WinRT/RO_INIT_TYPE.ahk

#Include ../CStyleArray.ahk

#DllLoad api-ms-win-core-winrt-l1-1-0.dll
#DllLoad api-ms-win-core-winrt-string-l1-1-0.dll

#Warn All,Off

class GeneratedWinRTClassTests {

    ; Kind of a general smoke test - ensure that we're not overriding any of the COM plumbing anywhere
    WinRTClassWrappers_Always_ExtendIInspectable() {
        xmlSettings := XmlLoadSettings()

        runtimeClassName := xmlSettings.GetRuntimeClassName()
        Assert.IsType(runtimeClassName, HSTRING)
        Assert.Equals(String(runtimeClassName), "Windows.Data.Xml.Dom.XmlLoadSettings")
    }

    class Extensions {
        As_WithRequiredInterface_ReturnsIt() {
            jsonVal := JsonValue.CreateNullValue()

            unk := jsonVal.As(IUnknown)
            Assert.IsType(unk, IUnknown)

            stringable := jsonVal.As(IStringable)
            Assert.IsType(stringable, IStringable)
            Assert.Equals(String(stringable.ToString()), "null")
        }

        As_WithUnsupportedInterface_ThrowsTypeError() {
            jsonVal := JsonValue.CreateNullValue()

            Assert.Throws((*) => jsonVal.As(IXmlLoadSettings), OSError)
        }

        As_WithSupportedWinRTClass_ReturnsIt() {
            jsonVal := JsonValue.CreateNullValue()
            iunk := jsonVal.As(IUnknown)
            cast := iunk.As(JsonValue)

            Assert.IsType(cast, JsonValue)
        }
    }

    class Constructors {

        Constructor_WithNoArgs_Works() {
            xmlSettings := XmlLoadSettings()

            Assert.IsType(xmlSettings, XmlLoadSettings)
            Yunit.Assert(xmlSettings.ptr != 0)
        }

        StaticConstructor_WithNoArgs_Works() {
            jsonVal := JsonValue.CreateNullValue()

            Assert.IsType(jsonVal, JsonValue)
        }

        StaticConstructor_WithPrimitiveArgs_Works() {
            boolVal := JsonValue.CreateBooleanValue(true)

            Assert.IsType(boolVal, JsonValue)
        }

        ComposableActivationMethod_ForUnactivatableClass_ThrowsOSError() {
            Assert.Throws(Button.CreateInstance.Bind(Button), OSError)
            Assert.IsType(Button.__IButtonFactory, IButtonFactory)
        }
    }

    class Properties {
        GetterAndSetter_ForPrimitiveValue_RetrievesValue() {
            xmlSettings := XmlLoadSettings()

            xmlSettings.MaxElementDepth := 10
        }

        Getter_WithStringReturnValue_ReturnsHSTRING() {
            url := Uri.CreateUri("https://www.autohotkey.com/docs/v2")
            Assert.IsType(url, Uri)
            Assert.IsType(url.AbsoluteUri, HSTRING)
            Assert.Equals(url.AbsoluteUri.ToString(), "https://www.autohotkey.com/docs/v2")
        }
    }

    class Methods {
        Method_WithPrimitiveReturnValue_ReturnsIt() {
            numVal := JsonValue.CreateNumberValue(42)

            returned := numVal.GetNumber()
            Assert.Equals(returned, 42)
        }

        Method_WithStringParams_AcceptsAHKStrings() {
            strVal := JsonValue.CreateStringValue("Test string")

            hStr := strVal.Stringify()

            Assert.IsType(strVal, JsonValue)
            
            Assert.IsType(hStr, HSTRING)
            Assert.Equals(hStr.ToString(), '"Test string"')
        }

        Method_WithStringParams_AcceptsHSTRINGs() {
            testStr := HSTRING.Create("Test string")
            strVal := JsonValue.CreateStringValue(HSTRING.Create("Test string"))

            hStr := strVal.Stringify()

            Assert.IsType(strVal, JsonValue)
            
            Assert.IsType(hStr, HSTRING)
            Assert.Equals(hStr.ToString(), '"Test string"')
        }

        Method_WithStringParams_AcceptsRawHandleValues() {
            testStr := HSTRING.Create("Test string")
            strVal := JsonValue.CreateStringValue(testStr.Value)

            hStr := strVal.Stringify()

            Assert.IsType(strVal, JsonValue)
            
            Assert.IsType(hStr, HSTRING)
            Assert.Equals(hStr.ToString(), '"Test string"')
        }

        /**
         * Verify that we correctly wrap returned runtime classes with their projected AHK types
         */
        Method_WithWinRTClassReturnValue_ReturnsClassInstance() {
            str := "https://www.example.com/query?param1=value1&param2=value2&param3=value3"
            url := Uri.CreateUri("https://www.example.com/query?param1=value1&param2=value2&param3=value3")

            queryParsed := url.QueryParsed
            Assert.IsType(queryParsed, WwwFormUrlDecoder)

            ; Quick functional check
            Assert.Equals(String(queryParsed.GetRuntimeClassName()), "Windows.Foundation.WwwFormUrlDecoder")
            Assert.Equals(String(queryParsed.GetFirstValueByName("param1")), "value1")
        }

        /**
         * Ensure that we properly wrap return type primitive/object
         */
        Method_ThatReturnsPrimitiveObject_ReturnsIInspectable() {
            static xaml := "
            (
                <StackPanel xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation">
                    <TextBlock Text="Hello, World!"/>
                </StackPanel>
            )"

            xamlManager := WindowsXamlManager.InitializeForCurrentThread()

            try {
                obj := XamlReader.Load(xaml)
                Assert.IsType(obj, IInspectable)
                Assert.Equals(String(obj.GetRuntimeClassName()), "Windows.UI.Xaml.Controls.StackPanel")
            }
            finally {
                xamlManager.Close()
            }
        }
    }

    class Generics {

        /**
         * Verify that we can follow the chain below and that our precomputed piid is queried for succesfully.
         * WwwFormUrlDecoder -> IIterator<IWwwFormUrlDecoderEntry> -> IWwwFormUrlDecoderEntry
         */
        GenericInterfaceAquisition_WithKnownTypeArgs_Succeeds() {
            decoder := WwwFormUrlDecoder.CreateWwwFormUrlDecoder("?param1=value1&param2=value2&param3=value3")

            iterator := decoder.First() ; "(0x80004002) No such interface supported" means piid is wrong
            entry := iterator.Current

            Assert.IsType(iterator, IIterator)
            Assert.Equals(iterator.T, IWwwFormUrlDecoderEntry)
            Assert.IsType(entry, IWwwFormUrlDecoderEntry)
            Assert.Equals(String(entry.Name), "param1")
            Assert.Equals(String(entry.Value), "value1")
        }

        WinRTClass_WithHandleGeneric_Works() {
            set := PropertySet()

            hStr := HSTRING.Create("ten")
            replaced := set.Insert(hStr.Value, PropertyValue.CreateInt32(10))

            Assert.Equals(set.Size, 1)
            Assert.Equals(set.HasKey(hStr.Value), true)

            found := set.Lookup(hStr.Value)
            Assert.IsType(found, IInspectable)
            Assert.Equals(String(found.GetRuntimeClassName()), "Windows.Foundation.IReference``1<Int32>")

            ; IReference implements IPropertyValue, which we can use
            Assert.Equals(found.As(IPropertyValue).Unbox(), 10)
        }

        WinRTClass_WithNestedGenerics_Works() {
            set := PropertySet()

            ; PropertySet -> IMap<String, Object>
            hStr := HSTRING.Create("ten")
            replaced := set.Insert(hStr.Value, PropertyValue.CreateInt32(10))

            Assert.Equals(set.Size, 1)

            ;IMap<String, Object> -> IIterable<IKeyValuePair<String, Object>> -> IIterator<IKeyValuePair<String, Object>>
            iterator := set.First()
            Assert.Equals(iterator.HasCurrent, true)

            ;IIterator<IKeyValuePair<String, Object>> -> IKeyValuePair<String, Object>
            entry := iterator.Current
            Assert.IsType(entry, IKeyValuePair)
            Assert.Equals(String(entry.GetRuntimeClassName()), "Windows.Foundation.Collections.IKeyValuePair``2<String, Object>")

            ; IKeyValuePair<String, Object> -> HSTRING
            Assert.IsType(entry.Key, HSTRING)
            Assert.Equals(String(entry.Key), "ten")
            ; IKeyValuePair<String, Object> -> IInspectable (which is what primitive objects are under the hood)
            Assert.IsType(entry.Value, IInspectable)
            Assert.Equals(String(entry.Value.GetRuntimeClassName()), "Windows.Foundation.IReference``1<Int32>")

            ; IReference implements IPropertyValue, which we can use
            Assert.Equals(entry.Value.As(IPropertyValue).Unbox(), 10)
        }
    }

    /**
     * Tests for the hand-written extensions added to IAsyncOperation & co
     */
    class Async {
        SynchronousAwait_OnSucces_ReturnsOperationResult() {
            thisFile := StorageFile.GetFileFromPathAsync(A_ScriptFullPath).Await()
            Assert.IsType(thisFile, StorageFile)
            Assert.Equals(String(thisFile.Name), A_ScriptName)
        }

        AwaitWithCallback_OnSuccess_InvokesCallbackWithOperation() {
            asyncResult := ""

            asyncOp := StorageFile.GetFileFromPathAsync(A_ScriptFullPath)
            asyncOp.AwaitWithCallback((result) => asyncResult := result)

            time := A_Now
            while(asyncResult == "") {
                if(DateDiff(time, A_Now, "seconds") >= 60)
                    throw TimeoutError(type(asyncOp) " did not complete within 60 seconds")
            }

            Assert.IsType(asyncResult, IAsyncOperation)
            Assert.Equals(String(asyncResult.GetResults().Name), A_ScriptName)
        }

        AwaitWithCallback_WithInvalidCallback_ThrowsMethodError() {
            asyncOp := StorageFile.GetFileFromPathAsync(A_ScriptFullPath)

            ; Callbacks must be callable with 1 arg
            Assert.Throws((*) => asyncOp.AwaitWithCallback(() => ""), MethodError)
            Assert.Throws((*) => asyncOp.AwaitWithCallback((arg1, arg2) => ""), MethodError)
        }

        Await_OnError_ThrowsOSError() {
            Assert.Throws((*) => StorageFile.GetFileFromPathAsync("not/a/filepath").Await(), OSError)
        }

        AwaitWithCallback_OnError_InvokesCallbackWithOperation() {
            asyncResult := ""

            asyncOp := StorageFile.GetFileFromPathAsync("not/a/filepath")
            asyncOp.AwaitWithCallback((result) => asyncResult := result)

            time := A_Now
            while(asyncResult == "") {
                if(DateDiff(time, A_Now, "seconds") >= 60)
                    throw TimeoutError(type(asyncOp) " did not complete within 60 seconds")
            }

            Assert.IsType(asyncResult, IAsyncOperation)
            Assert.Equals(asyncResult.As(IAsyncInfo).Status, AsyncStatus.Error)
        }
    }

    class SZArrays {
        /**
         * Test for a method that uses a ReceiveArray - note these are double-dereferenced pointers, so CStyleArrayList
         * has to use the Ptr* type instead of a wrapper type directly.
         */
        Method_WithReceiveArray_Works() {
            url := Uri.CreateUri("https://www.example.com/query?param1=value1&param2=value2&param3=value3")
            queryParsed := url.QueryParsed

            ; Preallocate a buffer to receive the items - note we have space for more items that we'll get back
            fillArr := CStyleArrayList(Primitive, "Ptr*", 4)
            numItems := queryParsed.GetMany(0, 4, fillArr.ptr)

            FileAppend("GetMany returned length: " numItems "`n", "*")
            FileAppend(fillArr.HexDump(), "*")

            Assert.Equals(numItems, 3)

            ; Because ReceiveArrays are double-indirected, we have to manually wrap each item
            ; Also important that we get every item because we need to release them (refcount starts at 1)
            Assert.Equals(IWwwFormUrlDecoderEntry(fillArr[1]).Name.ToString(), "param1")
            Assert.Equals(IWwwFormUrlDecoderEntry(fillArr[2]).Name.ToString(), "param2")
            Assert.Equals(IWwwFormUrlDecoderEntry(fillArr[3]).Name.ToString(), "param3")
        }
    }

    /**
     * Tests for built-ins like __Enum, __Item, etc. Strictly speaking not all methods, but you get the idea
     */
    class DunderMethods {
        class Enum {
            /**
             * Test for the IIterator interface itself
             */
            IIterator_IsEnumerable() {
                decoder := WwwFormUrlDecoder.CreateWwwFormUrlDecoder("?param1=value1&param2=value2&param3=value3")
                iterations := 0

                for(item in decoder.First()) {
                    Assert.IsType(item, IWwwFormUrlDecoderEntry)
                    Assert.Equals(String(item.Name), "param" A_Index)
                    Assert.Equals(String(item.Value), "value" A_Index)
                    iterations++
                }

                Assert.Equals(iterations, 3)
            }

            /**
             * Test for classes implementing IIterable
             */
            Enum_OneArgWithIterableClass_EnumeratesValues() {
                decoder := WwwFormUrlDecoder.CreateWwwFormUrlDecoder("?param1=value1&param2=value2&param3=value3")
                iterations := 0

                for(item in decoder) {
                    Assert.IsType(item, IWwwFormUrlDecoderEntry)
                    Assert.Equals(String(item.Name), "param" A_Index)
                    Assert.Equals(String(item.Value), "value" A_Index)
                    iterations++
                }

                Assert.Equals(iterations, 3)
            }

            Enum_TwoArgsWithIterableClass_ThrowsValueError() {
                Assert.Throws(BadIter, ValueError)

                BadIter() {
                    decoder := WwwFormUrlDecoder.CreateWwwFormUrlDecoder("?param1=value1&param2=value2&param3=value3")
                    for(one, two in decoder) {
                        throw MethodError("Unreachable")
                    }
                }
            }

            Enum_WhenCollectionIsModified_ThrowsOSError() {
                Assert.Throws(BadIter, OSError)

                BadIter() {
                    ; Should throw the WinRT version of a ConcurrentModificationException
                    try {
                        jsArr := JsonArray.Parse("[0, 1, 2, 3]")
                        for(item in jsArr) {
                            jsArr[A_Index - 1] := JsonValue.CreateNumberValue(42)
                        }
                    }
                    catch OSError as err {
                        Assert.Equals(err.Number, 0x8000000C)
                        FileAppend(Format("Caught {1}: {2}`r`n", type(err), err.message), "*")
                        throw err
                    }
                }
            }
        }

        class Item {
            class IVector {
                Class_ImplementingIVectorView_ItemGet_GetsItem() {
                    ; WwwFormUrlDecoder implements IVectorView
                    decoder := WwwFormUrlDecoder.CreateWwwFormUrlDecoder("?param1=value1&param2=value2&param3=value3")

                    ; Zero-indexed
                    val := decoder[1]
                    Assert.IsType(val, IWwwFormUrlDecoderEntry)
                    Assert.Equals(String(val.Name), "param2")
                    Assert.Equals(String(val.Value), "value2")
                }

                Class_ImplementingIVector_ItemSet_SetsItem() {
                    jsArr := JsonArray.Parse("[0, 1, 2, 3]")
                    jsArr[0] := JsonValue.CreateNumberValue(4.0)

                    val := jsArr.GetAt(0)
                    Assert.IsType(val, IJsonValue)
                    Assert.Equals(val.GetNumber(), 4)
                }

                Class_ImplementingIVector_ItemGet_GetsItem() {
                    jsArr := JsonArray.Parse("[1, 2, 3, 4]")
                    loop(jsArr.size) {
                        val := jsArr[A_Index - 1]
                        Assert.IsType(val, IJsonValue)
                        Assert.Equals(val.GetNumber(), A_Index)
                    }
                }

                IVector_ItemGet_GetsItem() {
                    jsArr := JsonArray.Parse("[1, 2, 3, 4]")
                    jsArr[0]                ; Force WinRT object to query for IVector and cast since it knows the piid
                    vec := jsArr.__IVector

                    loop(jsArr.size) {
                        val := vec[A_Index - 1]
                        Assert.IsType(val, IJsonValue)
                        Assert.Equals(val.GetNumber(), A_Index)
                    }
                }

                IVector_ItemSet_SetsItem() {
                    jsArr := JsonArray.Parse("[1, 2, 3, 4]")
                    jsArr[0]                ; Force WinRT object to query for IVector and cast since it knows the piid
                    vec := jsArr.__IVector

                    vec[0] := JsonValue.CreateNumberValue(4.0)

                    val := vec.GetAt(0)
                    Assert.IsType(val, IJsonValue)
                    Assert.Equals(val.GetNumber(), 4)
                }

                IVectorView_ItemGet_GetsItem() {
                    decoder := WwwFormUrlDecoder.CreateWwwFormUrlDecoder("?param1=value1&param2=value2&param3=value3")
                    decoder[0] ; Force WinRT object to query for IVector and cast since it knows the piid
                    vectorView := decoder.__IVectorView

                    ; Zero-indexed
                    val := vectorView[1]
                    Assert.IsType(val, IWwwFormUrlDecoderEntry)
                    Assert.Equals(String(val.Name), "param2")
                    Assert.Equals(String(val.Value), "value2")
                }
            }

            class IMap {
                Class_ImplementingIMap_ItemGet_GetsItem() {
                    strMap := StringMap()

                    keyStr := HSTRING.Create("key")
                    replaced := strMap.Insert(keyStr.value, HSTRING.Create("value").value)

                    val := strMap[keyStr.value]
                    Assert.IsType(val, HSTRING)
                    Assert.Equals(String(val), "value")
                }

                Class_ImplementingIMap_ItemSet_SetsItem() {
                    strMap := StringMap()

                    keyStr := HSTRING.Create("value")
                    strMap[keyStr] := keyStr.value

                    val := strMap.Lookup(keyStr)
                    Assert.IsType(val, HSTRING)
                    Assert.Equals(String(val), "value")
                }
            }
        }
    }
}

if(A_ScriptName == "GeneratedWinRTClass.test.ahk") {
    ; GeneratedWinRTClassTests.Methods().Methods_WithStringParams_AcceptHSTRINGs()
    Yunit.Use(DetailedStdOut).Test(GeneratedWinRTClassTests)
}