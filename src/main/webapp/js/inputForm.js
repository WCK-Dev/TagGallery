function addTag() {
		var existingTag = $("input[name='g_tag']").val()+'';
		var splitTags = existingTag.split(',');
		var newTag = $("#newTag").val();
		
		if(newTag.trim() == '') {
			alert("공백문자는 태그값으로 입력될 수 없습니다.")
			return false;
			
		} else {
			for(i=0; i<splitTags.length; i++) {
				if(splitTags[i] == newTag) {
					alert("동일한 태그는 중복 추가할 수 없습니다.");
					return false;
				}
			}
			if(existingTag == '') {
				$("input[name='g_tag']").val(newTag);
			} else {
				$("input[name='g_tag']").val(existingTag + "," +newTag);	
			}
			
			$("#newTag").val('');
			$(".tags").append("<b><span class='badge badge-pill badge-primary'>" + newTag + "</span> <a class='text-danger' onclick='deleteThisTag(this)'>&nbsp;x</a></b>")
		}
	}
	
	function enterAdd() {
		if(event.keyCode == 13) {
			event.preventDefault();
			addTag();
		}
	}
	
	function deleteThisTag(a_tag) {
		var existingTag = $("input[name='g_tag']").val()+'';
		var splitTags = existingTag.split(',');
		var delTag = $(a_tag).prev().text();
		var newVal = "";
		
		
		for(i=0; i<splitTags.length; i++) {
			if(splitTags[i] != delTag) {
				if(newVal == '') {
					newVal = splitTags[i];
				} else {
					newVal = newVal + "," + splitTags[i];
				}
			}
		}
		
		$("input[name='g_tag']").val(newVal);
		
		$(a_tag).parent().remove();
	}
	
	function testValidation() {
		var g_title =  $("input[name='g_title']").val();
		var g_content =  $("textarea[name='g_content']").val();
		var g_tag =  $("input[name='g_tag']").val();
		
		if(g_title.trim() == '') {
			alert("게시글 제목을 입력해주세요");
			$("input[name='g_title']").focus();
			return false;
		}
		if(g_content.trim() == '') {
			alert("게시글 내용을 입력해주세요");
			$("textarea[name='g_content']").focus();
			return false;
		}
		if(g_tag.trim() == '') {
			alert("최소 하나의 태그를 추가해주세요");
			$("input[id='newTag']").focus();
			return false;
		}
	}
	
	function chkFileType(obj) {

		var fileKind = obj.value.lastIndexOf('.');
		var fileName = obj.value.substring(fileKind+1,obj.length);
		var fileType = fileName.toLowerCase();

		var checkFileType = new Array();

		checkFileType=['jpg','gif','png','jpeg','bmp','tif'];

		if(checkFileType.indexOf(fileType)==-1) {

			alert('이미지만 업로드 가능합니다.');

			var parentObj = obj.parentNode;
			var node = parentObj.replaceChild(obj.cloneNode(true),obj);

			$("#files").val(""); 

			return false;
		}

	}